-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

--main = putStrLn "ok"

data ProfilePhoto = 
 ProfilePhoto { big :: File.File, small :: File.File, _id :: Int }  deriving (Show)

instance T.ToJSON ProfilePhoto where
 toJSON (ProfilePhoto { big = big, small = small, _id = _id }) =
  A.object [ "@type" A..= T.String "profilePhoto", "big" A..= big, "small" A..= small, "id" A..= _id ]



instance T.FromJSON ProfilePhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "profilePhoto" -> parseProfilePhoto v

   _ -> mempty ""
  where
   parseProfilePhoto :: A.Value -> T.Parser ProfilePhoto
   parseProfilePhoto = A.withObject "ProfilePhoto" $ \o -> do
    big <- o A..: "big"
    small <- o A..: "small"
    _id <- o A..: "id"
    return $ ProfilePhoto { big = big, small = small, _id = _id }