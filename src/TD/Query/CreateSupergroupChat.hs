{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateSupergroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an existing chat corresponding to a known supergroup or channel @supergroup_id Supergroup or channel identifier @force Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
data CreateSupergroupChat = CreateSupergroupChat
  { -- |
    force :: Maybe Bool,
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show CreateSupergroupChat where
  show
    CreateSupergroupChat
      { force = force_,
        supergroup_id = supergroup_id_
      } =
      "CreateSupergroupChat"
        ++ U.cc
          [ U.p "force" force_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON CreateSupergroupChat where
  toJSON
    CreateSupergroupChat
      { force = force_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "createSupergroupChat",
          "force" A..= force_,
          "supergroup_id" A..= supergroup_id_
        ]
