-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetLocation where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location

data SetLocation = 
 SetLocation { location :: Maybe Location.Location }  deriving (Show, Eq)

instance T.ToJSON SetLocation where
 toJSON (SetLocation { location = location }) =
  A.object [ "@type" A..= T.String "setLocation", "location" A..= location ]

instance T.FromJSON SetLocation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setLocation" -> parseSetLocation v
   _ -> mempty
  where
   parseSetLocation :: A.Value -> T.Parser SetLocation
   parseSetLocation = A.withObject "SetLocation" $ \o -> do
    location <- optional $ o A..: "location"
    return $ SetLocation { location = location }