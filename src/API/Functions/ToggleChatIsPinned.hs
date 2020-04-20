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



instance T.FromJSON ToggleChatIsPinned where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleChatIsPinned" -> parseToggleChatIsPinned v
  where
   parseToggleChatIsPinned :: A.Value -> T.Parser ToggleChatIsPinned
   parseToggleChatIsPinned = A.withObject "ToggleChatIsPinned" $ \o -> do
    is_pinned <- o A..: "is_pinned"
    chat_id <- o A..: "chat_id"
    return $ ToggleChatIsPinned { is_pinned = is_pinned, chat_id = chat_id }