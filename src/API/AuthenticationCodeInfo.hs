-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AuthenticationCodeInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.AuthenticationCodeType as AuthenticationCodeType

-- |
-- 
-- Information about the authentication code that was sent 
-- 
-- __phone_number__ A phone number that is being authenticated
-- 
-- __type__ Describes the way the code was sent to the user
-- 
-- __next_type__ Describes the way the next code will be sent to the user; may be null
-- 
-- __timeout__ Timeout before the code can be re-sent, in seconds
data AuthenticationCodeInfo = 

 AuthenticationCodeInfo { timeout :: Maybe Int, next_type :: Maybe AuthenticationCodeType.AuthenticationCodeType, _type :: Maybe AuthenticationCodeType.AuthenticationCodeType, phone_number :: Maybe String }  deriving (Eq)

instance Show AuthenticationCodeInfo where
 show AuthenticationCodeInfo { timeout=timeout, next_type=next_type, _type=_type, phone_number=phone_number } =
  "AuthenticationCodeInfo" ++ cc [p "timeout" timeout, p "next_type" next_type, p "_type" _type, p "phone_number" phone_number ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AuthenticationCodeInfo where
 toJSON AuthenticationCodeInfo { timeout = timeout, next_type = next_type, _type = _type, phone_number = phone_number } =
  A.object [ "@type" A..= T.String "authenticationCodeInfo", "timeout" A..= timeout, "next_type" A..= next_type, "type" A..= _type, "phone_number" A..= phone_number ]

instance T.FromJSON AuthenticationCodeInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "authenticationCodeInfo" -> parseAuthenticationCodeInfo v
   _ -> mempty
  where
   parseAuthenticationCodeInfo :: A.Value -> T.Parser AuthenticationCodeInfo
   parseAuthenticationCodeInfo = A.withObject "AuthenticationCodeInfo" $ \o -> do
    timeout <- mconcat [ o A..:? "timeout", readMaybe <$> (o A..: "timeout" :: T.Parser String)] :: T.Parser (Maybe Int)
    next_type <- o A..:? "next_type"
    _type <- o A..:? "type"
    phone_number <- o A..:? "phone_number"
    return $ AuthenticationCodeInfo { timeout = timeout, next_type = next_type, _type = _type, phone_number = phone_number }
 parseJSON _ = mempty
