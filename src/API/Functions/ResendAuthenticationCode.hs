-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendAuthenticationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Re-sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitCode and the next_code_type of the result is not null
data ResendAuthenticationCode = 
 ResendAuthenticationCode deriving (Show, Eq)

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