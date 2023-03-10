from pydantic import BaseModel


class HotelData(BaseModel):
    name: str
    description: str
    address: str
    latitude: float
    longitude: float
