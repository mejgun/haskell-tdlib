{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ToggleSupergroupSignMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether sender signature is added to sent messages in a channel; requires can_change_info administrator right @supergroup_id Identifier of the channel @sign_messages New value of sign_messages
data ToggleSupergroupSignMessages = ToggleSupergroupSignMessages
  { -- |
    sign_messages :: Maybe Bool,
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleSupergroupSignMessages where
  show
    ToggleSupergroupSignMessages
      { sign_messages = sign_messages,
        supergroup_id = supergroup_id
      } =
      "ToggleSupergroupSignMessages"
        ++ U.cc
          [ U.p "sign_messages" sign_messages,
            U.p "supergroup_id" supergroup_id
          ]

instance T.ToJSON ToggleSupergroupSignMessages where
  toJSON
    ToggleSupergroupSignMessages
      { sign_messages = sign_messages,
        supergroup_id = supergroup_id
      } =
      A.object
        [ "@type" A..= T.String "toggleSupergroupSignMessages",
          "sign_messages" A..= sign_messages,
          "supergroup_id" A..= supergroup_id
        ]
