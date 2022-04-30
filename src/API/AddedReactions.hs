-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AddedReactions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.AddedReaction as AddedReaction

-- |
-- 
-- Represents a list of reactions added to a message 
-- 
-- __total_count__ The total number of found reactions
-- 
-- __reactions__ The list of added reactions
-- 
-- __next_offset__ The offset for the next request. If empty, there are no more results
data AddedReactions = 

 AddedReactions { next_offset :: Maybe String, reactions :: Maybe [AddedReaction.AddedReaction], total_count :: Maybe Int }  deriving (Eq)

instance Show AddedReactions where
 show AddedReactions { next_offset=next_offset, reactions=reactions, total_count=total_count } =
  "AddedReactions" ++ U.cc [U.p "next_offset" next_offset, U.p "reactions" reactions, U.p "total_count" total_count ]

instance T.ToJSON AddedReactions where
 toJSON AddedReactions { next_offset = next_offset, reactions = reactions, total_count = total_count } =
  A.object [ "@type" A..= T.String "addedReactions", "next_offset" A..= next_offset, "reactions" A..= reactions, "total_count" A..= total_count ]

instance T.FromJSON AddedReactions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addedReactions" -> parseAddedReactions v
   _ -> mempty
  where
   parseAddedReactions :: A.Value -> T.Parser AddedReactions
   parseAddedReactions = A.withObject "AddedReactions" $ \o -> do
    next_offset <- o A..:? "next_offset"
    reactions <- o A..:? "reactions"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AddedReactions { next_offset = next_offset, reactions = reactions, total_count = total_count }
 parseJSON _ = mempty
