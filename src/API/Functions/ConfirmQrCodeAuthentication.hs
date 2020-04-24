-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ConfirmQrCodeAuthentication where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ConfirmQrCodeAuthentication = 
 ConfirmQrCodeAuthentication { link :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON ConfirmQrCodeAuthentication where
 toJSON (ConfirmQrCodeAuthentication { link = link }) =
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
    link <- optional $ o A..: "link"
    return $ ConfirmQrCodeAuthentication { link = link }