-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetUserProfilePhotos where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetUserProfilePhotos = 
 GetUserProfilePhotos { limit :: Int, offset :: Int, user_id :: Int }  deriving (Show)

instance T.ToJSON GetUserProfilePhotos where
 toJSON (GetUserProfilePhotos { limit = limit, offset = offset, user_id = user_id }) =
  A.object [ "@type" A..= T.String "getUserProfilePhotos", "limit" A..= limit, "offset" A..= offset, "user_id" A..= user_id ]



instance T.FromJSON GetUserProfilePhotos where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getUserProfilePhotos" -> parseGetUserProfilePhotos v

   _ -> mempty ""
  where
   parseGetUserProfilePhotos :: A.Value -> T.Parser GetUserProfilePhotos
   parseGetUserProfilePhotos = A.withObject "GetUserProfilePhotos" $ \o -> do
    limit <- o A..: "limit"
    offset <- o A..: "offset"
    user_id <- o A..: "user_id"
    return $ GetUserProfilePhotos { limit = limit, offset = offset, user_id = user_id }