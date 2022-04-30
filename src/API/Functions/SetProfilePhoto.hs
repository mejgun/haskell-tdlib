-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetProfilePhoto where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.InputChatPhoto as InputChatPhoto

-- |
-- 
-- Changes a profile photo for the current user 
-- 
-- __photo__ Profile photo to set
data SetProfilePhoto = 

 SetProfilePhoto { photo :: Maybe InputChatPhoto.InputChatPhoto }  deriving (Eq)

instance Show SetProfilePhoto where
 show SetProfilePhoto { photo=photo } =
  "SetProfilePhoto" ++ U.cc [U.p "photo" photo ]

instance T.ToJSON SetProfilePhoto where
 toJSON SetProfilePhoto { photo = photo } =
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
 parseJSON _ = mempty
