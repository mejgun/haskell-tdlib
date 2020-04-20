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
 | ChatTypeSecret { user_id :: Int, secret_chat_id :: Int }  -- deriving (Show)

instance T.ToJSON ChatType where
 toJSON (ChatTypePrivate { user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatTypePrivate", "user_id" A..= user_id ]

 toJSON (ChatTypeBasicGroup { basic_group_id = basic_group_id }) =
  A.object [ "@type" A..= T.String "chatTypeBasicGroup", "basic_group_id" A..= basic_group_id ]

 toJSON (ChatTypeSupergroup { is_channel = is_channel, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "chatTypeSupergroup", "is_channel" A..= is_channel, "supergroup_id" A..= supergroup_id ]

 toJSON (ChatTypeSecret { user_id = user_id, secret_chat_id = secret_chat_id }) =
  A.object [ "@type" A..= T.String "chatTypeSecret", "user_id" A..= user_id, "secret_chat_id" A..= secret_chat_id ]
-- chatTypePrivate ChatType  { user_id :: Int } 

-- chatTypeBasicGroup ChatType  { basic_group_id :: Int } 

-- chatTypeSupergroup ChatType  { is_channel :: Bool, supergroup_id :: Int } 

-- chatTypeSecret ChatType  { user_id :: Int, secret_chat_id :: Int } 

