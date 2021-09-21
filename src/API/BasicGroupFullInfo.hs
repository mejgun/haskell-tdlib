-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BasicGroupFullInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotCommands as BotCommands
import {-# SOURCE #-} qualified API.ChatInviteLink as ChatInviteLink
import {-# SOURCE #-} qualified API.ChatMember as ChatMember
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto

-- |
-- 
-- Contains full information about a basic group
-- 
-- __photo__ Chat photo; may be null
-- 
-- __param_description__ Group description. Updated only after the basic group is opened
-- 
-- __creator_user_id__ User identifier of the creator of the group; 0 if unknown
-- 
-- __members__ Group members
-- 
-- __invite_link__ Primary invite link for this group; may be null. For chat administrators with can_invite_users right only. Updated only after the basic group is opened
-- 
-- __bot_commands__ List of commands of bots in the group
data BasicGroupFullInfo = 

 BasicGroupFullInfo { bot_commands :: Maybe [BotCommands.BotCommands], invite_link :: Maybe ChatInviteLink.ChatInviteLink, members :: Maybe [ChatMember.ChatMember], creator_user_id :: Maybe Int, description :: Maybe String, photo :: Maybe ChatPhoto.ChatPhoto }  deriving (Show, Eq)

instance T.ToJSON BasicGroupFullInfo where
 toJSON (BasicGroupFullInfo { bot_commands = bot_commands, invite_link = invite_link, members = members, creator_user_id = creator_user_id, description = description, photo = photo }) =
  A.object [ "@type" A..= T.String "basicGroupFullInfo", "bot_commands" A..= bot_commands, "invite_link" A..= invite_link, "members" A..= members, "creator_user_id" A..= creator_user_id, "description" A..= description, "photo" A..= photo ]

instance T.FromJSON BasicGroupFullInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "basicGroupFullInfo" -> parseBasicGroupFullInfo v
   _ -> mempty
  where
   parseBasicGroupFullInfo :: A.Value -> T.Parser BasicGroupFullInfo
   parseBasicGroupFullInfo = A.withObject "BasicGroupFullInfo" $ \o -> do
    bot_commands <- o A..:? "bot_commands"
    invite_link <- o A..:? "invite_link"
    members <- o A..:? "members"
    creator_user_id <- mconcat [ o A..:? "creator_user_id", readMaybe <$> (o A..: "creator_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    description <- o A..:? "description"
    photo <- o A..:? "photo"
    return $ BasicGroupFullInfo { bot_commands = bot_commands, invite_link = invite_link, members = members, creator_user_id = creator_user_id, description = description, photo = photo }