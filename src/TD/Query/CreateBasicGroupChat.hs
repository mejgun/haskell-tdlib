module TD.Query.CreateBasicGroupChat(CreateBasicGroupChat(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data CreateBasicGroupChat -- ^ Returns an existing chat corresponding to a known basic group
  = CreateBasicGroupChat
    { basic_group_id :: Maybe Int  -- ^ Basic group identifier
    , force          :: Maybe Bool -- ^ Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
    }
  deriving (Eq)

instance Show CreateBasicGroupChat where
  show
    CreateBasicGroupChat
      { basic_group_id = basic_group_id_
      , force          = force_
      }
        = "CreateBasicGroupChat"
          ++ I.cc
          [ "basic_group_id" `I.p` basic_group_id_
          , "force"          `I.p` force_
          ]

instance AT.ToJSON CreateBasicGroupChat where
  toJSON
    CreateBasicGroupChat
      { basic_group_id = basic_group_id_
      , force          = force_
      }
        = A.object
          [ "@type"          A..= AT.String "createBasicGroupChat"
          , "basic_group_id" A..= basic_group_id_
          , "force"          A..= force_
          ]
