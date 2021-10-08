-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetLocation where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Location as Location

-- |
-- 
-- Changes the location of the current user. Needs to be called if GetOption("is_location_visible") is true and location changes for more than 1 kilometer 
-- 
-- __location__ The new location of the user
data SetLocation = 

 SetLocation { location :: Maybe Location.Location }  deriving (Eq)

instance Show SetLocation where
 show SetLocation { location=location } =
  "SetLocation" ++ cc [p "location" location ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetLocation where
 toJSON SetLocation { location = location } =
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
    location <- o A..:? "location"
    return $ SetLocation { location = location }
 parseJSON _ = mempty
