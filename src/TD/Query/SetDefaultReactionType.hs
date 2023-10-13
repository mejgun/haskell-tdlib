module TD.Query.SetDefaultReactionType
  (SetDefaultReactionType(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType

-- | Changes type of default reaction for the current user
data SetDefaultReactionType
  = SetDefaultReactionType
    { reaction_type :: Maybe ReactionType.ReactionType -- ^ New type of the default reaction
    }
  deriving (Eq)

instance Show SetDefaultReactionType where
  show
    SetDefaultReactionType
      { reaction_type = reaction_type_
      }
        = "SetDefaultReactionType"
          ++ I.cc
          [ "reaction_type" `I.p` reaction_type_
          ]

instance AT.ToJSON SetDefaultReactionType where
  toJSON
    SetDefaultReactionType
      { reaction_type = reaction_type_
      }
        = A.object
          [ "@type"         A..= AT.String "setDefaultReactionType"
          , "reaction_type" A..= reaction_type_
          ]

