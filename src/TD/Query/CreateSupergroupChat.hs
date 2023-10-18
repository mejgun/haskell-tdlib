module TD.Query.CreateSupergroupChat
  (CreateSupergroupChat(..)
  , defaultCreateSupergroupChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns an existing chat corresponding to a known supergroup or channel. Returns 'TD.Data.Chat.Chat'
data CreateSupergroupChat
  = CreateSupergroupChat
    { supergroup_id :: Maybe Int  -- ^ Supergroup or channel identifier
    , force         :: Maybe Bool -- ^ Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
    }
  deriving (Eq, Show)

instance I.ShortShow CreateSupergroupChat where
  shortShow
    CreateSupergroupChat
      { supergroup_id = supergroup_id_
      , force         = force_
      }
        = "CreateSupergroupChat"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          , "force"         `I.p` force_
          ]

instance AT.ToJSON CreateSupergroupChat where
  toJSON
    CreateSupergroupChat
      { supergroup_id = supergroup_id_
      , force         = force_
      }
        = A.object
          [ "@type"         A..= AT.String "createSupergroupChat"
          , "supergroup_id" A..= supergroup_id_
          , "force"         A..= force_
          ]

defaultCreateSupergroupChat :: CreateSupergroupChat
defaultCreateSupergroupChat =
  CreateSupergroupChat
    { supergroup_id = Nothing
    , force         = Nothing
    }

