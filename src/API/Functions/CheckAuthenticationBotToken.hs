-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckAuthenticationBotToken where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Checks the authentication token of a bot; to log in as a bot. Works only when the current authorization state is authorizationStateWaitPhoneNumber. Can be used instead of setAuthenticationPhoneNumber and checkAuthenticationCode to log in 
-- 
-- __token__ The bot token
data CheckAuthenticationBotToken = 

 CheckAuthenticationBotToken { token :: Maybe String }  deriving (Eq)

instance Show CheckAuthenticationBotToken where
 show CheckAuthenticationBotToken { token=token } =
  "CheckAuthenticationBotToken" ++ cc [p "token" token ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CheckAuthenticationBotToken where
 toJSON CheckAuthenticationBotToken { token = token } =
  A.object [ "@type" A..= T.String "checkAuthenticationBotToken", "token" A..= token ]

instance T.FromJSON CheckAuthenticationBotToken where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkAuthenticationBotToken" -> parseCheckAuthenticationBotToken v
   _ -> mempty
  where
   parseCheckAuthenticationBotToken :: A.Value -> T.Parser CheckAuthenticationBotToken
   parseCheckAuthenticationBotToken = A.withObject "CheckAuthenticationBotToken" $ \o -> do
    token <- o A..:? "token"
    return $ CheckAuthenticationBotToken { token = token }
 parseJSON _ = mempty
