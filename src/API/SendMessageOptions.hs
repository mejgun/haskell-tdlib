-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SendMessageOptions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageSchedulingState as MessageSchedulingState

--main = putStrLn "ok"

data SendMessageOptions = 
 SendMessageOptions { scheduling_state :: MessageSchedulingState.MessageSchedulingState, from_background :: Bool, disable_notification :: Bool }  deriving (Show)

instance T.ToJSON SendMessageOptions where
 toJSON (SendMessageOptions { scheduling_state = scheduling_state, from_background = from_background, disable_notification = disable_notification }) =
  A.object [ "@type" A..= T.String "sendMessageOptions", "scheduling_state" A..= scheduling_state, "from_background" A..= from_background, "disable_notification" A..= disable_notification ]



instance T.FromJSON SendMessageOptions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendMessageOptions" -> parseSendMessageOptions v

   _ -> mempty ""
  where
   parseSendMessageOptions :: A.Value -> T.Parser SendMessageOptions
   parseSendMessageOptions = A.withObject "SendMessageOptions" $ \o -> do
    scheduling_state <- o A..: "scheduling_state"
    from_background <- o A..: "from_background"
    disable_notification <- o A..: "disable_notification"
    return $ SendMessageOptions { scheduling_state = scheduling_state, from_background = from_background, disable_notification = disable_notification }