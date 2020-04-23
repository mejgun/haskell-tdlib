-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UpgradeBasicGroupChatToSupergroupChat where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data UpgradeBasicGroupChatToSupergroupChat = 
 UpgradeBasicGroupChatToSupergroupChat { chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON UpgradeBasicGroupChatToSupergroupChat where
 toJSON (UpgradeBasicGroupChatToSupergroupChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "upgradeBasicGroupChatToSupergroupChat", "chat_id" A..= chat_id ]

instance T.FromJSON UpgradeBasicGroupChatToSupergroupChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "upgradeBasicGroupChatToSupergroupChat" -> parseUpgradeBasicGroupChatToSupergroupChat v
   _ -> mempty
  where
   parseUpgradeBasicGroupChatToSupergroupChat :: A.Value -> T.Parser UpgradeBasicGroupChatToSupergroupChat
   parseUpgradeBasicGroupChatToSupergroupChat = A.withObject "UpgradeBasicGroupChatToSupergroupChat" $ \o -> do
    chat_id <- optional $ o A..: "chat_id"
    return $ UpgradeBasicGroupChatToSupergroupChat { chat_id = chat_id }