-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RequestQrCodeAuthentication where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data RequestQrCodeAuthentication = 
 RequestQrCodeAuthentication { other_user_ids :: [Int] }  deriving (Show)

instance T.ToJSON RequestQrCodeAuthentication where
 toJSON (RequestQrCodeAuthentication { other_user_ids = other_user_ids }) =
  A.object [ "@type" A..= T.String "requestQrCodeAuthentication", "other_user_ids" A..= other_user_ids ]

instance T.FromJSON RequestQrCodeAuthentication where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "requestQrCodeAuthentication" -> parseRequestQrCodeAuthentication v
   _ -> mempty
  where
   parseRequestQrCodeAuthentication :: A.Value -> T.Parser RequestQrCodeAuthentication
   parseRequestQrCodeAuthentication = A.withObject "RequestQrCodeAuthentication" $ \o -> do
    other_user_ids <- o A..: "other_user_ids"
    return $ RequestQrCodeAuthentication { other_user_ids = other_user_ids }