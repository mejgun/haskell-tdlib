module TD.Data.CanSendMessageToUserResult
  (CanSendMessageToUserResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes result of canSendMessageToUser
data CanSendMessageToUserResult
  = CanSendMessageToUserResultOk -- ^ The user can be messaged
  | CanSendMessageToUserResultUserIsDeleted -- ^ The user can't be messaged, because they are deleted or unknown
  | CanSendMessageToUserResultUserRestrictsNewChats -- ^ The user can't be messaged, because they restrict new chats with non-contacts
  deriving (Eq, Show)

instance I.ShortShow CanSendMessageToUserResult where
  shortShow CanSendMessageToUserResultOk
      = "CanSendMessageToUserResultOk"
  shortShow CanSendMessageToUserResultUserIsDeleted
      = "CanSendMessageToUserResultUserIsDeleted"
  shortShow CanSendMessageToUserResultUserRestrictsNewChats
      = "CanSendMessageToUserResultUserRestrictsNewChats"

instance AT.FromJSON CanSendMessageToUserResult where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "canSendMessageToUserResultOk"                    -> pure CanSendMessageToUserResultOk
      "canSendMessageToUserResultUserIsDeleted"         -> pure CanSendMessageToUserResultUserIsDeleted
      "canSendMessageToUserResultUserRestrictsNewChats" -> pure CanSendMessageToUserResultUserRestrictsNewChats
      _                                                 -> mempty
    
  parseJSON _ = mempty

