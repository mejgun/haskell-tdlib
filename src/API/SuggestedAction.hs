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
 -- Suggests the user to check whether 2-step verification password is still remembered
 SuggestedActionCheckPassword |
 -- |
 -- 
 -- Suggests the user to check whether authorization phone number is correct and change the phone number if it is inaccessible
 SuggestedActionCheckPhoneNumber |
 -- |
 -- 
 -- Suggests the user to see a hint about meaning of one and two ticks on sent message
 SuggestedActionSeeTicksHint |
 -- |
 -- 
 -- Suggests the user to convert specified supergroup to a broadcast group 
 -- 
 -- __supergroup_id__ Supergroup identifier
 SuggestedActionConvertToBroadcastGroup { supergroup_id :: Maybe Int }  deriving (Eq)

instance Show SuggestedAction where
 show SuggestedActionEnableArchiveAndMuteNewChats {  } =
  "SuggestedActionEnableArchiveAndMuteNewChats" ++ cc [ ]

 show SuggestedActionCheckPassword {  } =
  "SuggestedActionCheckPassword" ++ cc [ ]

 show SuggestedActionCheckPhoneNumber {  } =
  "SuggestedActionCheckPhoneNumber" ++ cc [ ]

 show SuggestedActionSeeTicksHint {  } =
  "SuggestedActionSeeTicksHint" ++ cc [ ]

 show SuggestedActionConvertToBroadcastGroup { supergroup_id=supergroup_id } =
  "SuggestedActionConvertToBroadcastGroup" ++ cc [p "supergroup_id" supergroup_id ]

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

 toJSON SuggestedActionSeeTicksHint {  } =
  A.object [ "@type" A..= T.String "suggestedActionSeeTicksHint" ]

 toJSON SuggestedActionConvertToBroadcastGroup { supergroup_id = supergroup_id } =
  A.object [ "@type" A..= T.String "suggestedActionConvertToBroadcastGroup", "supergroup_id" A..= supergroup_id ]

instance T.FromJSON SuggestedAction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "suggestedActionEnableArchiveAndMuteNewChats" -> parseSuggestedActionEnableArchiveAndMuteNewChats v
   "suggestedActionCheckPassword" -> parseSuggestedActionCheckPassword v
   "suggestedActionCheckPhoneNumber" -> parseSuggestedActionCheckPhoneNumber v
   "suggestedActionSeeTicksHint" -> parseSuggestedActionSeeTicksHint v
   "suggestedActionConvertToBroadcastGroup" -> parseSuggestedActionConvertToBroadcastGroup v
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

   parseSuggestedActionSeeTicksHint :: A.Value -> T.Parser SuggestedAction
   parseSuggestedActionSeeTicksHint = A.withObject "SuggestedActionSeeTicksHint" $ \o -> do
    return $ SuggestedActionSeeTicksHint {  }

   parseSuggestedActionConvertToBroadcastGroup :: A.Value -> T.Parser SuggestedAction
   parseSuggestedActionConvertToBroadcastGroup = A.withObject "SuggestedActionConvertToBroadcastGroup" $ \o -> do
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SuggestedActionConvertToBroadcastGroup { supergroup_id = supergroup_id }
 parseJSON _ = mempty
