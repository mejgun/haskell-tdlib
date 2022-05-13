{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RemoveBackground where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes background from the list of installed backgrounds @background_id The background identifier
data RemoveBackground = RemoveBackground
  { -- |
    background_id :: Maybe Int
  }
  deriving (Eq)

instance Show RemoveBackground where
  show
    RemoveBackground
      { background_id = background_id_
      } =
      "RemoveBackground"
        ++ U.cc
          [ U.p "background_id" background_id_
          ]

instance T.ToJSON RemoveBackground where
  toJSON
    RemoveBackground
      { background_id = background_id_
      } =
      A.object
        [ "@type" A..= T.String "removeBackground",
          "background_id" A..= background_id_
        ]
