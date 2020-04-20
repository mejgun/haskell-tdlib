-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Venue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location

--main = putStrLn "ok"

data Venue = 
 Venue { _type :: String, _id :: String, provider :: String, address :: String, title :: String, location :: Location.Location }  -- deriving (Show)

instance T.ToJSON Venue where
 toJSON (Venue { _type = _type, _id = _id, provider = provider, address = address, title = title, location = location }) =
  A.object [ "@type" A..= T.String "venue", "type" A..= _type, "id" A..= _id, "provider" A..= provider, "address" A..= address, "title" A..= title, "location" A..= location ]
-- venue Venue  { _type :: String, _id :: String, provider :: String, address :: String, title :: String, location :: Location.Location } 



instance T.FromJSON Venue where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "venue" -> parseVenue v
  where
   parseVenue :: A.Value -> T.Parser Venue
   parseVenue = A.withObject "Venue" $ \o -> do
    _type <- o A..: "type"
    _id <- o A..: "id"
    provider <- o A..: "provider"
    address <- o A..: "address"
    title <- o A..: "title"
    location <- o A..: "location"
    return $ Venue { _type = _type, _id = _id, provider = provider, address = address, title = title, location = location }