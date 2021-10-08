-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BotCommandScope where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Represents the scope to which bot commands are relevant
data BotCommandScope = 
 -- |
 -- 
 -- A scope covering all users
 BotCommandScopeDefault |
 -- |
 -- 
 -- A scope covering all private chats
 BotCommandScopeAllPrivateChats |
 -- |
 -- 
 -- A scope covering all group and supergroup chats
 BotCommandScopeAllGroupChats |
 -- |
 -- 
 -- A scope covering all group and supergroup chat administrators
 BotCommandScopeAllChatAdministrators |
 -- |
 -- 
 -- A scope covering all members of a chat 
 -- 
 -- __chat_id__ Chat identifier
 BotCommandScopeChat { chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A scope covering all administrators of a chat 
 -- 
 -- __chat_id__ Chat identifier
 BotCommandScopeChatAdministrators { chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A scope covering a member of a chat 
 -- 
 -- __chat_id__ Chat identifier
 -- 
 -- __user_id__ User identifier
 BotCommandScopeChatMember { user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show BotCommandScope where
 show BotCommandScopeDefault {  } =
  "BotCommandScopeDefault" ++ cc [ ]

 show BotCommandScopeAllPrivateChats {  } =
  "BotCommandScopeAllPrivateChats" ++ cc [ ]

 show BotCommandScopeAllGroupChats {  } =
  "BotCommandScopeAllGroupChats" ++ cc [ ]

 show BotCommandScopeAllChatAdministrators {  } =
  "BotCommandScopeAllChatAdministrators" ++ cc [ ]

 show BotCommandScopeChat { chat_id=chat_id } =
  "BotCommandScopeChat" ++ cc [p "chat_id" chat_id ]

 show BotCommandScopeChatAdministrators { chat_id=chat_id } =
  "BotCommandScopeChatAdministrators" ++ cc [p "chat_id" chat_id ]

 show BotCommandScopeChatMember { user_id=user_id, chat_id=chat_id } =
  "BotCommandScopeChatMember" ++ cc [p "user_id" user_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON BotCommandScope where
 toJSON BotCommandScopeDefault {  } =
  A.object [ "@type" A..= T.String "botCommandScopeDefault" ]

 toJSON BotCommandScopeAllPrivateChats {  } =
  A.object [ "@type" A..= T.String "botCommandScopeAllPrivateChats" ]

 toJSON BotCommandScopeAllGroupChats {  } =
  A.object [ "@type" A..= T.String "botCommandScopeAllGroupChats" ]

 toJSON BotCommandScopeAllChatAdministrators {  } =
  A.object [ "@type" A..= T.String "botCommandScopeAllChatAdministrators" ]

 toJSON BotCommandScopeChat { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "botCommandScopeChat", "chat_id" A..= chat_id ]

 toJSON BotCommandScopeChatAdministrators { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "botCommandScopeChatAdministrators", "chat_id" A..= chat_id ]

 toJSON BotCommandScopeChatMember { user_id = user_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "botCommandScopeChatMember", "user_id" A..= user_id, "chat_id" A..= chat_id ]

instance T.FromJSON BotCommandScope where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "botCommandScopeDefault" -> parseBotCommandScopeDefault v
   "botCommandScopeAllPrivateChats" -> parseBotCommandScopeAllPrivateChats v
   "botCommandScopeAllGroupChats" -> parseBotCommandScopeAllGroupChats v
   "botCommandScopeAllChatAdministrators" -> parseBotCommandScopeAllChatAdministrators v
   "botCommandScopeChat" -> parseBotCommandScopeChat v
   "botCommandScopeChatAdministrators" -> parseBotCommandScopeChatAdministrators v
   "botCommandScopeChatMember" -> parseBotCommandScopeChatMember v
   _ -> mempty
  where
   parseBotCommandScopeDefault :: A.Value -> T.Parser BotCommandScope
   parseBotCommandScopeDefault = A.withObject "BotCommandScopeDefault" $ \o -> do
    return $ BotCommandScopeDefault {  }

   parseBotCommandScopeAllPrivateChats :: A.Value -> T.Parser BotCommandScope
   parseBotCommandScopeAllPrivateChats = A.withObject "BotCommandScopeAllPrivateChats" $ \o -> do
    return $ BotCommandScopeAllPrivateChats {  }

   parseBotCommandScopeAllGroupChats :: A.Value -> T.Parser BotCommandScope
   parseBotCommandScopeAllGroupChats = A.withObject "BotCommandScopeAllGroupChats" $ \o -> do
    return $ BotCommandScopeAllGroupChats {  }

   parseBotCommandScopeAllChatAdministrators :: A.Value -> T.Parser BotCommandScope
   parseBotCommandScopeAllChatAdministrators = A.withObject "BotCommandScopeAllChatAdministrators" $ \o -> do
    return $ BotCommandScopeAllChatAdministrators {  }

   parseBotCommandScopeChat :: A.Value -> T.Parser BotCommandScope
   parseBotCommandScopeChat = A.withObject "BotCommandScopeChat" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ BotCommandScopeChat { chat_id = chat_id }

   parseBotCommandScopeChatAdministrators :: A.Value -> T.Parser BotCommandScope
   parseBotCommandScopeChatAdministrators = A.withObject "BotCommandScopeChatAdministrators" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ BotCommandScopeChatAdministrators { chat_id = chat_id }

   parseBotCommandScopeChatMember :: A.Value -> T.Parser BotCommandScope
   parseBotCommandScopeChatMember = A.withObject "BotCommandScopeChatMember" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ BotCommandScopeChatMember { user_id = user_id, chat_id = chat_id }
 parseJSON _ = mempty
