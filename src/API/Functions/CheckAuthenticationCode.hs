-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckAuthenticationCode where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CheckAuthenticationCode = 
 CheckAuthenticationCode { code :: Maybe String }  deriving (Show)

instance T.ToJSON CheckAuthenticationCode where
 toJSON (CheckAuthenticationCode { code = code }) =
  A.object [ "@type" A..= T.String "checkAuthenticationCode", "code" A..= code ]

instance T.FromJSON CheckAuthenticationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkAuthenticationCode" -> parseCheckAuthenticationCode v
   _ -> mempty
  where
   parseCheckAuthenticationCode :: A.Value -> T.Parser CheckAuthenticationCode
   parseCheckAuthenticationCode = A.withObject "CheckAuthenticationCode" $ \o -> do
    code <- optional $ o A..: "code"
    return $ CheckAuthenticationCode { code = code }