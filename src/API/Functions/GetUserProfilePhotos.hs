-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetUserProfilePhotos where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetUserProfilePhotos = 
 GetUserProfilePhotos { limit :: Maybe Int, offset :: Maybe Int, user_id :: Maybe Int }  deriving (Show)

instance T.ToJSON GetUserProfilePhotos where
 toJSON (GetUserProfilePhotos { limit = limit, offset = offset, user_id = user_id }) =
  A.object [ "@type" A..= T.String "getUserProfilePhotos", "limit" A..= limit, "offset" A..= offset, "user_id" A..= user_id ]

instance T.FromJSON GetUserProfilePhotos where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getUserProfilePhotos" -> parseGetUserProfilePhotos v
   _ -> mempty
  where
   parseGetUserProfilePhotos :: A.Value -> T.Parser GetUserProfilePhotos
   parseGetUserProfilePhotos = A.withObject "GetUserProfilePhotos" $ \o -> do
    limit <- optional $ o A..: "limit"
    offset <- optional $ o A..: "offset"
    user_id <- optional $ o A..: "user_id"
    return $ GetUserProfilePhotos { limit = limit, offset = offset, user_id = user_id }