-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleSupergroupSignMessages where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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
    sign_messages <- optional $ o A..: "sign_messages"
    supergroup_id <- optional $ o A..: "supergroup_id"
    return $ ToggleSupergroupSignMessages { sign_messages = sign_messages, supergroup_id = supergroup_id }