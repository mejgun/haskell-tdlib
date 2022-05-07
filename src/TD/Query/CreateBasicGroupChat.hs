{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CreateBasicGroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an existing chat corresponding to a known basic group @basic_group_id Basic group identifier @force Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
data CreateBasicGroupChat = CreateBasicGroupChat
  { -- |
    force :: Maybe Bool,
    -- |
    basic_group_id :: Maybe Int
  }
  deriving (Eq)

instance Show CreateBasicGroupChat where
  show
    CreateBasicGroupChat
      { force = force,
        basic_group_id = basic_group_id
      } =
      "CreateBasicGroupChat"
        ++ U.cc
          [ U.p "force" force,
            U.p "basic_group_id" basic_group_id
          ]

instance T.ToJSON CreateBasicGroupChat where
  toJSON
    CreateBasicGroupChat
      { force = force,
        basic_group_id = basic_group_id
      } =
      A.object
        [ "@type" A..= T.String "createBasicGroupChat",
          "force" A..= force,
          "basic_group_id" A..= basic_group_id
        ]
