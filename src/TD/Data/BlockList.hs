{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.BlockList where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a type of a block list
data BlockList
  = -- | The main block list that disallows writing messages to the current user, receiving their status and photo, viewing of stories, and some other actions
    BlockListMain
  | -- | The block list that disallows viewing of stories of the current user
    BlockListStories
  deriving (Eq)

instance Show BlockList where
  show BlockListMain =
    "BlockListMain"
      ++ U.cc
        []
  show BlockListStories =
    "BlockListStories"
      ++ U.cc
        []

instance T.FromJSON BlockList where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "blockListMain" -> parseBlockListMain v
      "blockListStories" -> parseBlockListStories v
      _ -> mempty
    where
      parseBlockListMain :: A.Value -> T.Parser BlockList
      parseBlockListMain = A.withObject "BlockListMain" $ \_ -> return BlockListMain

      parseBlockListStories :: A.Value -> T.Parser BlockList
      parseBlockListStories = A.withObject "BlockListStories" $ \_ -> return BlockListStories
  parseJSON _ = mempty

instance T.ToJSON BlockList where
  toJSON BlockListMain =
    A.object
      [ "@type" A..= T.String "blockListMain"
      ]
  toJSON BlockListStories =
    A.object
      [ "@type" A..= T.String "blockListStories"
      ]
