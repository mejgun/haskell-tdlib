-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ConfirmQrCodeAuthentication where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ConfirmQrCodeAuthentication = 
 ConfirmQrCodeAuthentication { link :: String }  -- deriving (Show)

instance T.ToJSON ConfirmQrCodeAuthentication where
 toJSON (ConfirmQrCodeAuthentication { link = link }) =
  A.object [ "@type" A..= T.String "confirmQrCodeAuthentication", "link" A..= link ]
-- confirmQrCodeAuthentication ConfirmQrCodeAuthentication  { link :: String } 



instance T.FromJSON ConfirmQrCodeAuthentication where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "confirmQrCodeAuthentication" -> parseConfirmQrCodeAuthentication v
  where
   parseConfirmQrCodeAuthentication :: A.Value -> T.Parser ConfirmQrCodeAuthentication
   parseConfirmQrCodeAuthentication = A.withObject "ConfirmQrCodeAuthentication" $ \o -> do
    link <- o A..: "link"
    return $ ConfirmQrCodeAuthentication { link = link }