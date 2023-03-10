from fastapi import APIRouter, UploadFile, Body, Depends
from aiomysql.connection import Connection
from ..models.events import EventData
from ..database import Database
from ..database.events import addEvent, getEvents, getEventsByLocation, bookEvent, getUserEvents, verifyBooking, updatePresence
import base64

event_router = APIRouter()


@event_router.post("/")
async def add_event(event_img: str = Body(...),
                    name: str = Body(...),
                    description: str = Body(...),
                    address: str = Body(...),
                    latitude: float = Body(...), longitude: float = Body(...),
                    scheduled_on: str = Body(...),
                    capacity: int = Body(...),
                    conn: Connection = Depends(Database.get_db)):

    event_data = EventData(name=name, description=description,
                           address=address, latitude=latitude, longitude=longitude, scheduled_on=scheduled_on, capacity=capacity)

    await addEvent(event_data, event_img, conn)

    return {
        "message": "Success"
    }


@event_router.get("/")
async def get_events(conn: Connection = Depends(Database.get_db)):
    events = await getEvents(conn)

    return events


@event_router.get("/nearby")
async def get_nearby_events(latitude: float, longitude: float, conn: Connection = Depends(Database.get_db)):
    events = await getEventsByLocation(latitude, longitude, conn)

    return events


@event_router.post("/book")
async def book_event(event_id: int = Body(...), user_id: str = Body(...), conn: Connection = Depends(Database.get_db)):
    await bookEvent(event_id, user_id, conn)

    return {
        "message": "Success"
    }


@event_router.get("/{user_id}")
async def user_events(user_id: str, conn: Connection = Depends(Database.get_db)):
    user_events = await getUserEvents(user_id, conn)

    return user_events


@event_router.post("/verify")
async def verify_user_booking(event_id: int = Body(...), user_id: str = Body(...), conn: Connection = Depends(Database.get_db)):
    booking = await verifyBooking(event_id, user_id, conn)

    if not booking:
        return {
            "success": "no"
        }
    await updatePresence(event_id, user_id, conn)
    return {
        "success": "yes"
    }
