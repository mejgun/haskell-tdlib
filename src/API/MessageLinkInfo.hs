-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Message as Message

--main = putStrLn "ok"

data MessageLinkInfo = 
 MessageLinkInfo { for_album :: Bool, message :: Message.Message, chat_id :: Int, is_public :: Bool }  -- deriving (Show)

instance T.ToJSON MessageLinkInfo where
 toJSON (MessageLinkInfo { for_album = for_album, message = message, chat_id = chat_id, is_public = is_public }) =
  A.object [ "@type" A..= T.String "messageLinkInfo", "for_album" A..= for_album, "message" A..= message, "chat_id" A..= chat_id, "is_public" A..= is_public ]
-- messageLinkInfo MessageLinkInfo  { for_album :: Bool, message :: Message.Message, chat_id :: Int, is_public :: Bool } 

