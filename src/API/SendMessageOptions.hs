-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SendMessageOptions where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageSchedulingState as MessageSchedulingState

data SendMessageOptions = 
 SendMessageOptions { scheduling_state :: Maybe MessageSchedulingState.MessageSchedulingState, from_background :: Maybe Bool, disable_notification :: Maybe Bool }  deriving (Show)

instance T.ToJSON SendMessageOptions where
 toJSON (SendMessageOptions { scheduling_state = scheduling_state, from_background = from_background, disable_notification = disable_notification }) =
  A.object [ "@type" A..= T.String "sendMessageOptions", "scheduling_state" A..= scheduling_state, "from_background" A..= from_background, "disable_notification" A..= disable_notification ]

instance T.FromJSON SendMessageOptions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendMessageOptions" -> parseSendMessageOptions v
   _ -> mempty
  where
   parseSendMessageOptions :: A.Value -> T.Parser SendMessageOptions
   parseSendMessageOptions = A.withObject "SendMessageOptions" $ \o -> do
    scheduling_state <- optional $ o A..: "scheduling_state"
    from_background <- optional $ o A..: "from_background"
    disable_notification <- optional $ o A..: "disable_notification"
    return $ SendMessageOptions { scheduling_state = scheduling_state, from_background = from_background, disable_notification = disable_notification }