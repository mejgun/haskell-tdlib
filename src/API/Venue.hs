-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Venue where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Location as Location

-- |
-- 
-- Describes a venue 
-- 
-- __location__ Venue location; as defined by the sender
-- 
-- __title__ Venue name; as defined by the sender
-- 
-- __address__ Venue address; as defined by the sender
-- 
-- __provider__ Provider of the venue database; as defined by the sender. Currently only "foursquare" and "gplaces" (Google Places) need to be supported
-- 
-- __id__ Identifier of the venue in the provider database; as defined by the sender
-- 
-- __type__ Type of the venue in the provider database; as defined by the sender
data Venue = 

 Venue { _type :: Maybe String, _id :: Maybe String, provider :: Maybe String, address :: Maybe String, title :: Maybe String, location :: Maybe Location.Location }  deriving (Eq)

instance Show Venue where
 show Venue { _type=_type, _id=_id, provider=provider, address=address, title=title, location=location } =
  "Venue" ++ cc [p "_type" _type, p "_id" _id, p "provider" provider, p "address" address, p "title" title, p "location" location ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Venue where
 toJSON Venue { _type = _type, _id = _id, provider = provider, address = address, title = title, location = location } =
  A.object [ "@type" A..= T.String "venue", "type" A..= _type, "id" A..= _id, "provider" A..= provider, "address" A..= address, "title" A..= title, "location" A..= location ]

instance T.FromJSON Venue where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "venue" -> parseVenue v
   _ -> mempty
  where
   parseVenue :: A.Value -> T.Parser Venue
   parseVenue = A.withObject "Venue" $ \o -> do
    _type <- o A..:? "type"
    _id <- o A..:? "id"
    provider <- o A..:? "provider"
    address <- o A..:? "address"
    title <- o A..:? "title"
    location <- o A..:? "location"
    return $ Venue { _type = _type, _id = _id, provider = provider, address = address, title = title, location = location }
 parseJSON _ = mempty
