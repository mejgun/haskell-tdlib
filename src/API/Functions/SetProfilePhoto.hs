-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetProfilePhoto where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Uploads a new profile photo for the current user. If something changes, updateUser will be sent 
-- 
-- __photo__ Profile photo to set. inputFileId and inputFileRemote may still be unsupported
data SetProfilePhoto = 

 SetProfilePhoto { photo :: Maybe InputFile.InputFile }  deriving (Show, Eq)

instance T.ToJSON SetProfilePhoto where
 toJSON (SetProfilePhoto { photo = photo }) =
  A.object [ "@type" A..= T.String "setProfilePhoto", "photo" A..= photo ]

instance T.FromJSON SetProfilePhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setProfilePhoto" -> parseSetProfilePhoto v
   _ -> mempty
  where
   parseSetProfilePhoto :: A.Value -> T.Parser SetProfilePhoto
   parseSetProfilePhoto = A.withObject "SetProfilePhoto" $ \o -> do
    photo <- o A..:? "photo"
    return $ SetProfilePhoto { photo = photo }