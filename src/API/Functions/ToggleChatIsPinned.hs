-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleChatIsPinned where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ToggleChatIsPinned = 
 ToggleChatIsPinned { is_pinned :: Maybe Bool, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON ToggleChatIsPinned where
 toJSON (ToggleChatIsPinned { is_pinned = is_pinned, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "toggleChatIsPinned", "is_pinned" A..= is_pinned, "chat_id" A..= chat_id ]

instance T.FromJSON ToggleChatIsPinned where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleChatIsPinned" -> parseToggleChatIsPinned v
   _ -> mempty
  where
   parseToggleChatIsPinned :: A.Value -> T.Parser ToggleChatIsPinned
   parseToggleChatIsPinned = A.withObject "ToggleChatIsPinned" $ \o -> do
    is_pinned <- optional $ o A..: "is_pinned"
    chat_id <- optional $ o A..: "chat_id"
    return $ ToggleChatIsPinned { is_pinned = is_pinned, chat_id = chat_id }