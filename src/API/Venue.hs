-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Venue where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location

data Venue = 
 Venue { _type :: Maybe String, _id :: Maybe String, provider :: Maybe String, address :: Maybe String, title :: Maybe String, location :: Maybe Location.Location }  deriving (Show, Eq)

instance T.ToJSON Venue where
 toJSON (Venue { _type = _type, _id = _id, provider = provider, address = address, title = title, location = location }) =
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
    _type <- optional $ o A..: "type"
    _id <- optional $ o A..: "id"
    provider <- optional $ o A..: "provider"
    address <- optional $ o A..: "address"
    title <- optional $ o A..: "title"
    location <- optional $ o A..: "location"
    return $ Venue { _type = _type, _id = _id, provider = provider, address = address, title = title, location = location }