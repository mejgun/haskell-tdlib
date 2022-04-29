-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SuggestedAction where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes an action suggested to the current user
data SuggestedAction = 
 -- |
 -- 
 -- Suggests the user to enable "archive_and_mute_new_chats_from_unknown_users" option
 SuggestedActionEnableArchiveAndMuteNewChats |
 -- |
 -- 
 -- Suggests the user to check whether they still remember their 2-step verification password
 SuggestedActionCheckPassword |
 -- |
 -- 
 -- Suggests the user to check whether authorization phone number is correct and change the phone number if it is inaccessible
 SuggestedActionCheckPhoneNumber |
 -- |
 -- 
 -- Suggests the user to view a hint about the meaning of one and two check marks on sent messages
 SuggestedActionViewChecksHint |
 -- |
 -- 
 -- Suggests the user to convert specified supergroup to a broadcast group 
 -- 
 -- __supergroup_id__ Supergroup identifier
 SuggestedActionConvertToBroadcastGroup { supergroup_id :: Maybe Int }  |
 -- |
 -- 
 -- Suggests the user to set a 2-step verification password to be able to log in again 
 -- 
 -- __authorization_delay__ The number of days to pass between consecutive authorizations if the user declines to set password
 SuggestedActionSetPassword { authorization_delay :: Maybe Int }  deriving (Eq)

instance Show SuggestedAction where
 show SuggestedActionEnableArchiveAndMuteNewChats {  } =
  "SuggestedActionEnableArchiveAndMuteNewChats" ++ cc [ ]

 show SuggestedActionCheckPassword {  } =
  "SuggestedActionCheckPassword" ++ cc [ ]

 show SuggestedActionCheckPhoneNumber {  } =
  "SuggestedActionCheckPhoneNumber" ++ cc [ ]

 show SuggestedActionViewChecksHint {  } =
  "SuggestedActionViewChecksHint" ++ cc [ ]

 show SuggestedActionConvertToBroadcastGroup { supergroup_id=supergroup_id } =
  "SuggestedActionConvertToBroadcastGroup" ++ cc [p "supergroup_id" supergroup_id ]

 show SuggestedActionSetPassword { authorization_delay=authorization_delay } =
  "SuggestedActionSetPassword" ++ cc [p "authorization_delay" authorization_delay ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SuggestedAction where
 toJSON SuggestedActionEnableArchiveAndMuteNewChats {  } =
  A.object [ "@type" A..= T.String "suggestedActionEnableArchiveAndMuteNewChats" ]

 toJSON SuggestedActionCheckPassword {  } =
  A.object [ "@type" A..= T.String "suggestedActionCheckPassword" ]

 toJSON SuggestedActionCheckPhoneNumber {  } =
  A.object [ "@type" A..= T.String "suggestedActionCheckPhoneNumber" ]

 toJSON SuggestedActionViewChecksHint {  } =
  A.object [ "@type" A..= T.String "suggestedActionViewChecksHint" ]

 toJSON SuggestedActionConvertToBroadcastGroup { supergroup_id = supergroup_id } =
  A.object [ "@type" A..= T.String "suggestedActionConvertToBroadcastGroup", "supergroup_id" A..= supergroup_id ]

 toJSON SuggestedActionSetPassword { authorization_delay = authorization_delay } =
  A.object [ "@type" A..= T.String "suggestedActionSetPassword", "authorization_delay" A..= authorization_delay ]

instance T.FromJSON SuggestedAction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "suggestedActionEnableArchiveAndMuteNewChats" -> parseSuggestedActionEnableArchiveAndMuteNewChats v
   "suggestedActionCheckPassword" -> parseSuggestedActionCheckPassword v
   "suggestedActionCheckPhoneNumber" -> parseSuggestedActionCheckPhoneNumber v
   "suggestedActionViewChecksHint" -> parseSuggestedActionViewChecksHint v
   "suggestedActionConvertToBroadcastGroup" -> parseSuggestedActionConvertToBroadcastGroup v
   "suggestedActionSetPassword" -> parseSuggestedActionSetPassword v
   _ -> mempty
  where
   parseSuggestedActionEnableArchiveAndMuteNewChats :: A.Value -> T.Parser SuggestedAction
   parseSuggestedActionEnableArchiveAndMuteNewChats = A.withObject "SuggestedActionEnableArchiveAndMuteNewChats" $ \o -> do
    return $ SuggestedActionEnableArchiveAndMuteNewChats {  }

   parseSuggestedActionCheckPassword :: A.Value -> T.Parser SuggestedAction
   parseSuggestedActionCheckPassword = A.withObject "SuggestedActionCheckPassword" $ \o -> do
    return $ SuggestedActionCheckPassword {  }

   parseSuggestedActionCheckPhoneNumber :: A.Value -> T.Parser SuggestedAction
   parseSuggestedActionCheckPhoneNumber = A.withObject "SuggestedActionCheckPhoneNumber" $ \o -> do
    return $ SuggestedActionCheckPhoneNumber {  }

   parseSuggestedActionViewChecksHint :: A.Value -> T.Parser SuggestedAction
   parseSuggestedActionViewChecksHint = A.withObject "SuggestedActionViewChecksHint" $ \o -> do
    return $ SuggestedActionViewChecksHint {  }

   parseSuggestedActionConvertToBroadcastGroup :: A.Value -> T.Parser SuggestedAction
   parseSuggestedActionConvertToBroadcastGroup = A.withObject "SuggestedActionConvertToBroadcastGroup" $ \o -> do
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SuggestedActionConvertToBroadcastGroup { supergroup_id = supergroup_id }

   parseSuggestedActionSetPassword :: A.Value -> T.Parser SuggestedAction
   parseSuggestedActionSetPassword = A.withObject "SuggestedActionSetPassword" $ \o -> do
    authorization_delay <- mconcat [ o A..:? "authorization_delay", readMaybe <$> (o A..: "authorization_delay" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SuggestedActionSetPassword { authorization_delay = authorization_delay }
 parseJSON _ = mempty
