-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RequestQrCodeAuthentication where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Requests QR code authentication by scanning a QR code on another logged in device. Works only when the current authorization state is authorizationStateWaitPhoneNumber,
-- 
-- -or if there is no pending authentication query and the current authorization state is authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword
-- 
-- __other_user_ids__ List of user identifiers of other users currently using the application
data RequestQrCodeAuthentication = 

 RequestQrCodeAuthentication { other_user_ids :: Maybe [Int] }  deriving (Show, Eq)

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
    other_user_ids <- o A..:? "other_user_ids"
    return $ RequestQrCodeAuthentication { other_user_ids = other_user_ids }