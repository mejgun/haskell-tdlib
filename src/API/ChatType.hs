-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatType = 
 ChatTypePrivate { user_id :: Int }  
 | ChatTypeBasicGroup { basic_group_id :: Int }  
 | ChatTypeSupergroup { is_channel :: Bool, supergroup_id :: Int }  
 | ChatTypeSecret { user_id :: Int, secret_chat_id :: Int }  deriving (Show)

instance T.ToJSON ChatType where
 toJSON (ChatTypePrivate { user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatTypePrivate", "user_id" A..= user_id ]

 toJSON (ChatTypeBasicGroup { basic_group_id = basic_group_id }) =
  A.object [ "@type" A..= T.String "chatTypeBasicGroup", "basic_group_id" A..= basic_group_id ]

 toJSON (ChatTypeSupergroup { is_channel = is_channel, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "chatTypeSupergroup", "is_channel" A..= is_channel, "supergroup_id" A..= supergroup_id ]

 toJSON (ChatTypeSecret { user_id = user_id, secret_chat_id = secret_chat_id }) =
  A.object [ "@type" A..= T.String "chatTypeSecret", "user_id" A..= user_id, "secret_chat_id" A..= secret_chat_id ]



instance T.FromJSON ChatType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatTypePrivate" -> parseChatTypePrivate v
   "chatTypeBasicGroup" -> parseChatTypeBasicGroup v
   "chatTypeSupergroup" -> parseChatTypeSupergroup v
   "chatTypeSecret" -> parseChatTypeSecret v

   _ -> mempty ""
  where
   parseChatTypePrivate :: A.Value -> T.Parser ChatType
   parseChatTypePrivate = A.withObject "ChatTypePrivate" $ \o -> do
    user_id <- o A..: "user_id"
    return $ ChatTypePrivate { user_id = user_id }

   parseChatTypeBasicGroup :: A.Value -> T.Parser ChatType
   parseChatTypeBasicGroup = A.withObject "ChatTypeBasicGroup" $ \o -> do
    basic_group_id <- o A..: "basic_group_id"
    return $ ChatTypeBasicGroup { basic_group_id = basic_group_id }

   parseChatTypeSupergroup :: A.Value -> T.Parser ChatType
   parseChatTypeSupergroup = A.withObject "ChatTypeSupergroup" $ \o -> do
    is_channel <- o A..: "is_channel"
    supergroup_id <- o A..: "supergroup_id"
    return $ ChatTypeSupergroup { is_channel = is_channel, supergroup_id = supergroup_id }

   parseChatTypeSecret :: A.Value -> T.Parser ChatType
   parseChatTypeSecret = A.withObject "ChatTypeSecret" $ \o -> do
    user_id <- o A..: "user_id"
    secret_chat_id <- o A..: "secret_chat_id"
    return $ ChatTypeSecret { user_id = user_id, secret_chat_id = secret_chat_id }