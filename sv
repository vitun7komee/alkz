    if (curL > maxL)
    {
        maxL = curL;
        maxVec = curVec;
    }
    for (int i = 0; i < vec.size(); ++i)
    {
        Konechn curTile = vec[i];
        if (!vec[i].in)
        {
            if ((prevL != -1) && (prevR != -1))
            {
                if (curTile.left == prevR)
                {
                    vec[i].in = true;
                    ++curL;
                    curVec.push_back(curTile);
                    find_max_len(vec, curL, maxL, curVec, maxVec, prevL, curTile.right);
                    curVec.pop_back();
                    --curL;
                    vec[i].in = false;
                }
                if (curTile.right == prevL)
                {
                    vec[i].in = true;
                    ++curL;
                    curVec.insert(curVec.begin(), curTile);
                    find_max_len(vec, curL, maxL, curVec, maxVec, curTile.left, prevR);
                    curVec.pop_back();
                    --curL;
                    vec[i].in = false;
                }
            }
            else
            {
                vec[i].in = true;
                ++curL;
                curVec.insert(curVec.begin(), curTile);
                find_max_len(vec, curL, maxL, curVec, maxVec, curTile.left, curTile.right);
                curVec.pop_back();
                --curL;
                vec[i].in = false;
            }
        }
    }
}

// Ð¾Ð±Ñ‘Ñ€Ñ‚ÐºÐ° Ð´Ð»Ñ Ð²Ñ‹Ð·Ð¾Ð²Ð° Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð¹ Ñ„ÑƒÐ½ÐºÑ†Ð¸Ð¸
vector<Konechn> task1(vector<Konechn>& vec)
{
    int maxL = 0, curL = 0;
    vector<Konechn> curVec;
    vector<Konechn> MaxVec;
    find_max_len(vec, curL, maxL, curVec, MaxVec, -1, -1);
    return MaxVec;
}


int main()
{
    
    vector<Konechn> Pair1 = { LeftRight(123), LeftRight(43567), LeftRight(22221), LeftRight(6784), LeftRight(3466), LeftRight(7777), LeftRight(8888), LeftRight(99431) };
    vector<Konechn> maxTile = task1(Pair1);
    for (auto item : maxTile)
    {
        cout << "(" << item.left << " " << item.ch<< " " << item.right << ")" << " ";
    }  

}
