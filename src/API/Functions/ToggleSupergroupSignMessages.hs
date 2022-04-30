-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleSupergroupSignMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Toggles whether sender signature is added to sent messages in a channel; requires can_change_info administrator right 
-- 
-- __supergroup_id__ Identifier of the channel
-- 
-- __sign_messages__ New value of sign_messages
data ToggleSupergroupSignMessages = 

 ToggleSupergroupSignMessages { sign_messages :: Maybe Bool, supergroup_id :: Maybe Int }  deriving (Eq)

instance Show ToggleSupergroupSignMessages where
 show ToggleSupergroupSignMessages { sign_messages=sign_messages, supergroup_id=supergroup_id } =
  "ToggleSupergroupSignMessages" ++ U.cc [U.p "sign_messages" sign_messages, U.p "supergroup_id" supergroup_id ]

instance T.ToJSON ToggleSupergroupSignMessages where
 toJSON ToggleSupergroupSignMessages { sign_messages = sign_messages, supergroup_id = supergroup_id } =
  A.object [ "@type" A..= T.String "toggleSupergroupSignMessages", "sign_messages" A..= sign_messages, "supergroup_id" A..= supergroup_id ]

instance T.FromJSON ToggleSupergroupSignMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleSupergroupSignMessages" -> parseToggleSupergroupSignMessages v
   _ -> mempty
  where
   parseToggleSupergroupSignMessages :: A.Value -> T.Parser ToggleSupergroupSignMessages
   parseToggleSupergroupSignMessages = A.withObject "ToggleSupergroupSignMessages" $ \o -> do
    sign_messages <- o A..:? "sign_messages"
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleSupergroupSignMessages { sign_messages = sign_messages, supergroup_id = supergroup_id }
 parseJSON _ = mempty
