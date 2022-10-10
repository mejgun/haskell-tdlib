{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetDefaultReactionType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ReactionType as ReactionType
import qualified Utils as U

-- |
-- Changes type of default reaction for the current user @reaction_type New type of the default reaction
data SetDefaultReactionType = SetDefaultReactionType
  { -- |
    reaction_type :: Maybe ReactionType.ReactionType
  }
  deriving (Eq)

instance Show SetDefaultReactionType where
  show
    SetDefaultReactionType
      { reaction_type = reaction_type_
      } =
      "SetDefaultReactionType"
        ++ U.cc
          [ U.p "reaction_type" reaction_type_
          ]

instance T.ToJSON SetDefaultReactionType where
  toJSON
    SetDefaultReactionType
      { reaction_type = reaction_type_
      } =
      A.object
        [ "@type" A..= T.String "setDefaultReactionType",
          "reaction_type" A..= reaction_type_
        ]
