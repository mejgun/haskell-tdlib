-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UpgradeBasicGroupChatToSupergroupChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Creates a new supergroup from an existing basic group and sends a corresponding messageChatUpgradeTo and messageChatUpgradeFrom; requires creator privileges. Deactivates the original basic group 
-- 
-- __chat_id__ Identifier of the chat to upgrade
data UpgradeBasicGroupChatToSupergroupChat = 

 UpgradeBasicGroupChatToSupergroupChat { chat_id :: Maybe Int }  deriving (Eq)

instance Show UpgradeBasicGroupChatToSupergroupChat where
 show UpgradeBasicGroupChatToSupergroupChat { chat_id=chat_id } =
  "UpgradeBasicGroupChatToSupergroupChat" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON UpgradeBasicGroupChatToSupergroupChat where
 toJSON UpgradeBasicGroupChatToSupergroupChat { chat_id = chat_id } =
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
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UpgradeBasicGroupChatToSupergroupChat { chat_id = chat_id }
 parseJSON _ = mempty
