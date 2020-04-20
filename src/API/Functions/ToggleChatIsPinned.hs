-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleChatIsPinned where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ToggleChatIsPinned = 
 ToggleChatIsPinned { is_pinned :: Bool, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON ToggleChatIsPinned where
 toJSON (ToggleChatIsPinned { is_pinned = is_pinned, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "toggleChatIsPinned", "is_pinned" A..= is_pinned, "chat_id" A..= chat_id ]
-- toggleChatIsPinned ToggleChatIsPinned  { is_pinned :: Bool, chat_id :: Int } 

