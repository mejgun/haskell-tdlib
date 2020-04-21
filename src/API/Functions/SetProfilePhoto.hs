-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data SetProfilePhoto = 
 SetProfilePhoto { photo :: InputFile.InputFile }  deriving (Show)

instance T.ToJSON SetProfilePhoto where
 toJSON (SetProfilePhoto { photo = photo }) =
  A.object [ "@type" A..= T.String "setProfilePhoto", "photo" A..= photo ]



instance T.FromJSON SetProfilePhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setProfilePhoto" -> parseSetProfilePhoto v

   _ -> mempty ""
  where
   parseSetProfilePhoto :: A.Value -> T.Parser SetProfilePhoto
   parseSetProfilePhoto = A.withObject "SetProfilePhoto" $ \o -> do
    photo <- o A..: "photo"
    return $ SetProfilePhoto { photo = photo }