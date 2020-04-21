-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckAuthenticationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckAuthenticationCode = 
 CheckAuthenticationCode { code :: String }  deriving (Show)

instance T.ToJSON CheckAuthenticationCode where
 toJSON (CheckAuthenticationCode { code = code }) =
  A.object [ "@type" A..= T.String "checkAuthenticationCode", "code" A..= code ]



instance T.FromJSON CheckAuthenticationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkAuthenticationCode" -> parseCheckAuthenticationCode v

   _ -> mempty ""
  where
   parseCheckAuthenticationCode :: A.Value -> T.Parser CheckAuthenticationCode
   parseCheckAuthenticationCode = A.withObject "CheckAuthenticationCode" $ \o -> do
    code <- o A..: "code"
    return $ CheckAuthenticationCode { code = code }