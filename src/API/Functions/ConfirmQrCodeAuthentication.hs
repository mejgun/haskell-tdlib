-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ConfirmQrCodeAuthentication where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Confirms QR code authentication on another device. Returns created session on success 
-- 
-- __link__ A link from a QR code. The link must be scanned by the in-app camera
data ConfirmQrCodeAuthentication = 

 ConfirmQrCodeAuthentication { link :: Maybe String }  deriving (Eq)

instance Show ConfirmQrCodeAuthentication where
 show ConfirmQrCodeAuthentication { link=link } =
  "ConfirmQrCodeAuthentication" ++ U.cc [U.p "link" link ]

instance T.ToJSON ConfirmQrCodeAuthentication where
 toJSON ConfirmQrCodeAuthentication { link = link } =
  A.object [ "@type" A..= T.String "confirmQrCodeAuthentication", "link" A..= link ]

instance T.FromJSON ConfirmQrCodeAuthentication where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "confirmQrCodeAuthentication" -> parseConfirmQrCodeAuthentication v
   _ -> mempty
  where
   parseConfirmQrCodeAuthentication :: A.Value -> T.Parser ConfirmQrCodeAuthentication
   parseConfirmQrCodeAuthentication = A.withObject "ConfirmQrCodeAuthentication" $ \o -> do
    link <- o A..:? "link"
    return $ ConfirmQrCodeAuthentication { link = link }
 parseJSON _ = mempty
