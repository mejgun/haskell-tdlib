-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserFullInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.BotCommand as BotCommand
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto

-- |
-- 
-- Contains full information about a user
-- 
-- __photo__ User profile photo; may be null
-- 
-- __is_blocked__ True, if the user is blocked by the current user
-- 
-- __can_be_called__ True, if the user can be called
-- 
-- __supports_video_calls__ True, if a video call can be created with the user
-- 
-- __has_private_calls__ True, if the user can't be called due to their privacy settings
-- 
-- __need_phone_number_privacy_exception__ True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used
-- 
-- __bio__ A short user bio
-- 
-- __share_text__ For bots, the text that is shown on the bot's profile page and is sent together with the link when users share the bot
-- 
-- __param_description__ For bots, the text shown in the chat with the bot if the chat is empty
-- 
-- __group_in_common_count__ Number of group chats where both the other user and the current user are a member; 0 for the current user
-- 
-- __commands__ For bots, list of the bot commands
data UserFullInfo = 

 UserFullInfo { commands :: Maybe [BotCommand.BotCommand], group_in_common_count :: Maybe Int, description :: Maybe String, share_text :: Maybe String, bio :: Maybe String, need_phone_number_privacy_exception :: Maybe Bool, has_private_calls :: Maybe Bool, supports_video_calls :: Maybe Bool, can_be_called :: Maybe Bool, is_blocked :: Maybe Bool, photo :: Maybe ChatPhoto.ChatPhoto }  deriving (Eq)

instance Show UserFullInfo where
 show UserFullInfo { commands=commands, group_in_common_count=group_in_common_count, description=description, share_text=share_text, bio=bio, need_phone_number_privacy_exception=need_phone_number_privacy_exception, has_private_calls=has_private_calls, supports_video_calls=supports_video_calls, can_be_called=can_be_called, is_blocked=is_blocked, photo=photo } =
  "UserFullInfo" ++ cc [p "commands" commands, p "group_in_common_count" group_in_common_count, p "description" description, p "share_text" share_text, p "bio" bio, p "need_phone_number_privacy_exception" need_phone_number_privacy_exception, p "has_private_calls" has_private_calls, p "supports_video_calls" supports_video_calls, p "can_be_called" can_be_called, p "is_blocked" is_blocked, p "photo" photo ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON UserFullInfo where
 toJSON UserFullInfo { commands = commands, group_in_common_count = group_in_common_count, description = description, share_text = share_text, bio = bio, need_phone_number_privacy_exception = need_phone_number_privacy_exception, has_private_calls = has_private_calls, supports_video_calls = supports_video_calls, can_be_called = can_be_called, is_blocked = is_blocked, photo = photo } =
  A.object [ "@type" A..= T.String "userFullInfo", "commands" A..= commands, "group_in_common_count" A..= group_in_common_count, "description" A..= description, "share_text" A..= share_text, "bio" A..= bio, "need_phone_number_privacy_exception" A..= need_phone_number_privacy_exception, "has_private_calls" A..= has_private_calls, "supports_video_calls" A..= supports_video_calls, "can_be_called" A..= can_be_called, "is_blocked" A..= is_blocked, "photo" A..= photo ]

instance T.FromJSON UserFullInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "userFullInfo" -> parseUserFullInfo v
   _ -> mempty
  where
   parseUserFullInfo :: A.Value -> T.Parser UserFullInfo
   parseUserFullInfo = A.withObject "UserFullInfo" $ \o -> do
    commands <- o A..:? "commands"
    group_in_common_count <- mconcat [ o A..:? "group_in_common_count", readMaybe <$> (o A..: "group_in_common_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    description <- o A..:? "description"
    share_text <- o A..:? "share_text"
    bio <- o A..:? "bio"
    need_phone_number_privacy_exception <- o A..:? "need_phone_number_privacy_exception"
    has_private_calls <- o A..:? "has_private_calls"
    supports_video_calls <- o A..:? "supports_video_calls"
    can_be_called <- o A..:? "can_be_called"
    is_blocked <- o A..:? "is_blocked"
    photo <- o A..:? "photo"
    return $ UserFullInfo { commands = commands, group_in_common_count = group_in_common_count, description = description, share_text = share_text, bio = bio, need_phone_number_privacy_exception = need_phone_number_privacy_exception, has_private_calls = has_private_calls, supports_video_calls = supports_video_calls, can_be_called = can_be_called, is_blocked = is_blocked, photo = photo }
 parseJSON _ = mempty
