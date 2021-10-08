-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendAuthenticationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Re-sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitCode, the next_code_type of the result is not null and the server-specified timeout has passed
data ResendAuthenticationCode = 

 ResendAuthenticationCode deriving (Eq)

instance Show ResendAuthenticationCode where
 show ResendAuthenticationCode {  } =
  "ResendAuthenticationCode" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ResendAuthenticationCode where
 toJSON ResendAuthenticationCode {  } =
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
 parseJSON _ = mempty
