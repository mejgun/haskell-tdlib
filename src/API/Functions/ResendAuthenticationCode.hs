-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendAuthenticationCode where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ResendAuthenticationCode = 
 ResendAuthenticationCode deriving (Show)

instance T.ToJSON ResendAuthenticationCode where
 toJSON (ResendAuthenticationCode {  }) =
  A.object [ "@type" A..= T.String "resendAuthenticationCode" ]

instance T.FromJSON ResendAuthenticationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendAuthenticationCode" -> parseResendAuthenticationCode v
   _ -> mempty
  where
   parseResendAuthenticationCode :: A.Value -> T.Parser ResendAuthenticationCode
   parseResendAuthenticationCode = A.withObject "ResendAuthenticationCode" $ \o -> do
    return $ ResendAuthenticationCode {  }