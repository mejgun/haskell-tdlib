-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleSupergroupSignMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Toggles sender signatures messages sent in a channel; requires can_change_info rights 
-- 
-- __supergroup_id__ Identifier of the channel
-- 
-- __sign_messages__ New value of sign_messages
data ToggleSupergroupSignMessages = 

 ToggleSupergroupSignMessages { sign_messages :: Maybe Bool, supergroup_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ToggleSupergroupSignMessages where
 toJSON (ToggleSupergroupSignMessages { sign_messages = sign_messages, supergroup_id = supergroup_id }) =
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