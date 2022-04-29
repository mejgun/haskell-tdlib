-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleSessionCanAcceptSecretChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Toggles whether a session can accept incoming secret chats 
-- 
-- __session_id__ Session identifier
-- 
-- __can_accept_secret_chats__ Pass true to allow accepring secret chats by the session; pass false otherwise
data ToggleSessionCanAcceptSecretChats = 

 ToggleSessionCanAcceptSecretChats { can_accept_secret_chats :: Maybe Bool, session_id :: Maybe Int }  deriving (Eq)

instance Show ToggleSessionCanAcceptSecretChats where
 show ToggleSessionCanAcceptSecretChats { can_accept_secret_chats=can_accept_secret_chats, session_id=session_id } =
  "ToggleSessionCanAcceptSecretChats" ++ cc [p "can_accept_secret_chats" can_accept_secret_chats, p "session_id" session_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ToggleSessionCanAcceptSecretChats where
 toJSON ToggleSessionCanAcceptSecretChats { can_accept_secret_chats = can_accept_secret_chats, session_id = session_id } =
  A.object [ "@type" A..= T.String "toggleSessionCanAcceptSecretChats", "can_accept_secret_chats" A..= can_accept_secret_chats, "session_id" A..= session_id ]

instance T.FromJSON ToggleSessionCanAcceptSecretChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleSessionCanAcceptSecretChats" -> parseToggleSessionCanAcceptSecretChats v
   _ -> mempty
  where
   parseToggleSessionCanAcceptSecretChats :: A.Value -> T.Parser ToggleSessionCanAcceptSecretChats
   parseToggleSessionCanAcceptSecretChats = A.withObject "ToggleSessionCanAcceptSecretChats" $ \o -> do
    can_accept_secret_chats <- o A..:? "can_accept_secret_chats"
    session_id <- mconcat [ o A..:? "session_id", readMaybe <$> (o A..: "session_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleSessionCanAcceptSecretChats { can_accept_secret_chats = can_accept_secret_chats, session_id = session_id }
 parseJSON _ = mempty
